import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';
import { QuestionChoose as QuestionChooseModel } from './question-choose';

class Exam extends Model {
  toJSON() {
    const origin = {
      id: this.id,
      name: this.name,
      phone: this.phone,
      coach: this.coach,
      score: this.score,
      extend: this.extend,
      poster: this.poster,
      create_time: this.create_time
    };
    return origin;
  }
}

Exam.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: Sequelize.STRING(150),
      allowNull: false
    },
    phone: {
      type: Sequelize.STRING(20),
      allowNull: false
    },
    coach: {
      type: Sequelize.STRING(200),
      allowNull: true
    },
    score: {
      type: Sequelize.INTEGER,
      allowNull: true
    },
    extend: {
      type: Sequelize.TEXT,
      allowNull: true
    },
    poster: {
      type: Sequelize.STRING(200),
      allowNull: true
    }
  },
  merge(
    {
      sequelize,
      tableName: 'exam',
      modelName: 'exam'
    },
    InfoCrudMixin.options
  )
);

export { Exam };
