import { NotFound, Forbidden } from 'lin-mizar';
import Sequelize from 'sequelize';
import sequelize from '../lib/db';
import { Question as Model } from '../model/question';
import { QuestionChoose as QuestionChooseModel } from '../model/question-choose';

class QuestionDao {
  async getItem(id) {
    const item = await Model.findOne({
      where: {
        id
      },
      include: [{
        model: QuestionChooseModel,
        as: 'choose'
      }]
    });
    return item;
  }

  async getItemByKeyword(q) {
    const item = await Model.findOne({
      where: {
        title: {
          [Sequelize.Op.like]: `%${q}%`
        }
      }
    });
    return item;
  }

  async getItems() {
    const items = await Model.findAll({
      include: [{
        model: QuestionChooseModel,
        as: 'choose'
      }]
    });
    return items;
  }

  async createItem(v) {
    let transaction;
    try {
      transaction = await sequelize.transaction();
      const question = {
        title: v.get('body.title'),
        author: v.get('body.author'),
        summary: v.get('body.summary'),
        score: v.get('body.score'),
        answer: v.get('body.answer')
      };
      const { id: question_id } = await Model.create(question, {
        transaction
      });

      for (const item of v.get('body.choose') || []) {
        await QuestionChooseModel.create(
          {
            question_id,
            key: item.key,
            summary: item.summary
          },
          {
            transaction
          }
        );
      }
      await transaction.commit();
    } catch (error) {
      if (transaction) await transaction.rollback();
    }
    return true;
  }

  async updateItem(v, id) {
    const item = await Model.findByPk(id);
    if (!item) {
      throw new NotFound({
        code: 10022
      });
    }
    item.title = v.get('body.title');
    item.author = v.get('body.author');
    item.summary = v.get('body.summary');
    item.score = v.get('body.score');
    item.answer = v.get('body.answer');
    await item.save();

    for (const item of v.get('body.choose') || []) {
      if (item.id) {
        const items = await QuestionChooseModel.findByPk(item.id);
        items.key = item.key;
        items.summary = item.summary;
        await items.save();
      } else {
        const bk = new QuestionChooseModel();
        bk.question_id = id;
        bk.key = item.key;
        bk.summary = item.summary;
        await bk.save();
      }
    }
  }

  async deleteItem(id) {
    const item = await Model.findOne({
      where: {
        id
      }
    });
    if (!item) {
      throw new NotFound({
        code: 10022
      });
    }
    item.destroy();
  }
}

export { QuestionDao };
