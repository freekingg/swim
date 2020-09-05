const questionRouter = {
  route: null,
  name: null,
  title: '题目管理',
  type: 'folder', // 类型: folder, tab, view
  icon: 'iconfont icon-tushuguanli',
  filePath: 'view/question/', // 文件路径
  order: null,
  inNav: true,
  children: [{
    title: '题目列表',
    type: 'view',
    name: 'QuestionList',
    route: '/question/list',
    filePath: 'view/question/question.vue',
    inNav: true,
    icon: 'iconfont icon-tushuguanli',
  }, {
    title: '考试记录',
    type: 'view',
    name: 'ExamList',
    route: '/exam/list',
    filePath: 'view/exam/exam.vue',
    inNav: true,
    icon: 'iconfont icon-tushuguanli',
  },
  ],
}

export default questionRouter
