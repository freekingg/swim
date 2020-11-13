import { NotFound, Forbidden } from 'lin-mizar';
import Sequelize, { json } from 'sequelize';
import { Exam as Model } from '../model/exam';

import { createPoster } from '../lib/poster';

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
    let extend = v.get('body.extend');
    bk.name = v.get('body.name');
    bk.phone = v.get('body.phone');
    bk.coach = v.get('body.coach');
    bk.score = v.get('body.score');
    bk.extend = extend;
    const instance = await bk.save();

    // 保存与生成海报
    let poster = await createPoster(instance.id);
    console.log('poster', poster);
    const item = await Model.findByPk(instance.id);
    if (!item) {
      return;
    }
    item.poster = poster;
    await item.save();
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
