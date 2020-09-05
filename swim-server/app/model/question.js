import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';
import { QuestionChoose as QuestionChooseModel } from './question-choose';

class Question extends Model {
  toJSON() {
    const origin = {
      id: this.id,
      title: this.title,
      author: this.author,
      summary: this.summary,
      image: this.image,
      score: this.score,
      answer: this.answer,
      create_time: this.create_time,
      choose: this.choose
    };
    return origin;
  }
}

Question.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    title: {
      type: Sequelize.STRING(150),
      allowNull: false
    },
    author: {
      type: Sequelize.STRING(30),
      allowNull: true,
      defaultValue: '未名'
    },
    summary: {
      type: Sequelize.STRING(1000),
      allowNull: true
    },
    score: {
      type: Sequelize.INTEGER,
      allowNull: false
    },
    image: {
      type: Sequelize.STRING(100),
      allowNull: true
    },
    answer: {
      type: Sequelize.STRING(50),
      allowNull: true
    }
  },
  merge(
    {
      sequelize,
      tableName: 'question',
      modelName: 'question'
    },
    InfoCrudMixin.options
  )
);

Question.hasMany(QuestionChooseModel, { foreignKey: 'question_id', targetKey: 'id', as: 'choose' });
export { Question };
