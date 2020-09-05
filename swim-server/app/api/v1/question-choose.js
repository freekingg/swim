import { LinRouter, NotFound, disableLoading } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt';
import {
  QuestionChooseSearchValidator,
  CreateOrUpdateQuestionChooseValidator
} from '../../validator/question-choose';
import { PositiveIdValidator } from '../../validator/common';

import { getSafeParamId } from '../../lib/util';
import { QuestionChooseDao } from '../../dao/question-choose';

// book 的红图实例
const questionApi = new LinRouter({
  prefix: '/v1/question/choose',
  module: '题目'
});

// 数据库访问层实例
const questionDto = new QuestionChooseDao();

questionApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  const id = v.get('path.id');
  const book = await questionDto.getItem(id);
  if (!book) {
    throw new NotFound({
      code: 10022
    });
  }
  ctx.json(book);
});

questionApi.get('/', async ctx => {
  const books = await questionDto.getItems();
  // if (!books || books.length < 1) {
  //   throw new NotFound({
  //     message: '没有找到相关书籍'
  //   });
  // }
  ctx.json(books);
});

questionApi.get('/search/one', async ctx => {
  const v = await new QuestionChooseSearchValidator().validate(ctx);
  const book = await questionDto.getItemByKeyword(v.get('query.q'));
  if (!book) {
    console.log(book);
    // throw new BookNotFound();
  }
  ctx.json(book);
});

questionApi.post('/', async ctx => {
  const v = await new CreateOrUpdateQuestionChooseValidator().validate(ctx);
  await questionDto.createItem(v);
  ctx.success({
    code: 12
  });
});

questionApi.put('/:id', async ctx => {
  const v = await new CreateOrUpdateQuestionChooseValidator().validate(ctx);
  const id = getSafeParamId(ctx);
  await questionDto.updateItem(v, id);
  ctx.success({
    code: 13
  });
});

questionApi.linDelete(
  'deleteQuestion',
  '/:id',
  questionApi.permission('删除问题'),
  groupRequired,
  async ctx => {
    const v = await new PositiveIdValidator().validate(ctx);
    const id = v.get('path.id');
    await questionDto.deleteItem(id);
    ctx.success({
      code: 14
    });
  }
);

module.exports = { questionApi, [disableLoading]: false };
