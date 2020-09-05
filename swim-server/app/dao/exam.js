import { NotFound, Forbidden } from 'lin-mizar';
import Sequelize from 'sequelize';
import { Exam as Model } from '../model/exam';

class ExamDao {
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

  async createItem(v) {
    const bk = new Model();
    bk.name = v.get('body.name');
    bk.phone = v.get('body.phone');
    bk.coach = v.get('body.coach');
    bk.score = v.get('body.score');
    bk.extend = v.get('body.extend');
    await bk.save();
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

export { ExamDao };
