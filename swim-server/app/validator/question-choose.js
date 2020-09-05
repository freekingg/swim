import { LinValidator, Rule } from 'lin-mizar';

class QuestionChooseSearchValidator extends LinValidator {
  constructor() {
    super();
    this.q = new Rule('isOptional');
  }
}

class CreateOrUpdateQuestionChooseValidator extends LinValidator {
  constructor() {
    super();
    this.key = new Rule('isNotEmpty', '必须传入选项名称');
    this.summary = new Rule('isNotEmpty', '必须传入选项说明');
  }
}

export { QuestionChooseSearchValidator, CreateOrUpdateQuestionChooseValidator };
