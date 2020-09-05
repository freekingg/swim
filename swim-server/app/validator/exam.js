import { LinValidator, Rule } from 'lin-mizar';

class ExamSearchValidator extends LinValidator {
  constructor() {
    super();
    this.q = new Rule('isOptional');
  }
}

class CreateOrUpdateExamValidator extends LinValidator {
  constructor() {
    super();
    this.name = new Rule('isNotEmpty', '必须传入名称');
    this.phone = new Rule('isNotEmpty', '必须传入手机号');
  }
}

export { CreateOrUpdateExamValidator, ExamSearchValidator };
