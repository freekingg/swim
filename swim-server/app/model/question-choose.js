import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class QuestionChoose extends Model {
  toJSON() {
    const origin = {
      id: this.id,
      key: this.key,
      summary: this.summary,
      question_id: this.question_id
    };
    return origin;
  }
}

QuestionChoose.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    question_id: {
      type: Sequelize.STRING(50),
      allowNull: false
    },
    key: {
      type: Sequelize.STRING(10),
      allowNull: false
    },
    summary: {
      type: Sequelize.STRING(1000),
      allowNull: true
    }
  },
  merge(
    {
      sequelize,
      tableName: 'question_choose',
      modelName: 'question_choose'
    },
    InfoCrudMixin.options
  )
);

export { QuestionChoose };
