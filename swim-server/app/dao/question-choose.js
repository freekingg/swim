import { NotFound, Forbidden } from 'lin-mizar';
import Sequelize from 'sequelize';
import { QuestionChoose as Model } from '../model/question-choose';

class QuestionChooseDao {
  async getItem(id) {
    const item = await Model.findOne({
      where: {
        id
      }
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
    const items = await Model.findAll();
    return items;
  }

  async createItems(v) {
    const bk = new Model();
    bk.question_id = v.get('body.question_id');
    bk.title = v.get('body.key');
    bk.summary = v.get('body.summary');
    await bk.save();
  }

  async updateItem(v, id) {
    const item = await Model.findByPk(id);
    if (!item) {
      throw new NotFound({
        code: 10022
      });
    }
    item.question_id = v.get('body.question_id');
    item.title = v.get('body.title');
    item.summary = v.get('body.summary');
    await item.save();
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

export { QuestionChooseDao };
