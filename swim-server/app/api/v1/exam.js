import { LinRouter, NotFound, disableLoading } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt';
import {
  ExamSearchValidator,
  CreateOrUpdateExamValidator
} from '../../validator/exam';
import { PositiveIdValidator } from '../../validator/common';

import { getSafeParamId } from '../../lib/util';
import { ExamDao } from '../../dao/exam';

// book 的红图实例
const examApi = new LinRouter({
  prefix: '/v1/exam',
  module: '题目'
});

// 数据库访问层实例
const examDto = new ExamDao();

examApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  const id = v.get('path.id');
  const book = await examDto.getItem(id);
  if (!book) {
    throw new NotFound({
      code: 10022
    });
  }
  ctx.json(book);
});

examApi.get('/', async ctx => {
  const books = await examDto.getItems();
  // if (!books || books.length < 1) {
  //   throw new NotFound({
  //     message: '没有找到相关书籍'
  //   });
  // }
  ctx.json(books);
});

examApi.get('/search/one', async ctx => {
  const v = await new ExamSearchValidator().validate(ctx);
  const book = await examDto.getItemByKeyword(v.get('query.q'));
  if (!book) {
    console.log(book);
    // throw new BookNotFound();
  }
  ctx.json(book);
});

examApi.post('/', async ctx => {
  const v = await new CreateOrUpdateExamValidator().validate(ctx);
  await examDto.createItem(v);
  ctx.success({
    code: 12
  });
});

examApi.put('/:id', async ctx => {
  const v = await new CreateOrUpdateExamValidator().validate(ctx);
  const id = getSafeParamId(ctx);
  await examDto.updateItem(v, id);
  ctx.success({
    code: 13
  });
});

examApi.linDelete(
  'deleteExam',
  '/:id',
  examApi.permission('删除试卷'),
  groupRequired,
  async ctx => {
    const v = await new PositiveIdValidator().validate(ctx);
    const id = v.get('path.id');
    await examDto.deleteItem(id);
    ctx.success({
      code: 14
    });
  }
);

module.exports = { examApi, [disableLoading]: false };
