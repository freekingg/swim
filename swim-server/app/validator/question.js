import { LinValidator, Rule } from 'lin-mizar';

class QuestionSearchValidator extends LinValidator {
  constructor() {
    super();
    this.q = new Rule('isOptional');
  }
}

class CreateOrUpdateQuestionValidator extends LinValidator {
  constructor() {
    super();
    this.title = new Rule('isNotEmpty', '必须传入名称');
    this.score = new Rule('isNotEmpty', '必须传入分值');
  }
}

export { CreateOrUpdateQuestionValidator, QuestionSearchValidator };
