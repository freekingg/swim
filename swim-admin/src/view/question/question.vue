<template>
  <div class="container">
    <el-row class="title" type="flex" justify="space-between">
      <el-col :span="8">题目列表信息</el-col>
      <el-col :span="8" class="text-right">
        <el-button-group>
          <el-button type="primary" icon="el-icon-plus" @click="addOrUpdateHandle">添加</el-button>
        </el-button-group>
      </el-col>
    </el-row>
    <div class="wrap">
      <el-table size="mini" v-loading="dataListLoading" :data="dataList" border>
        <el-table-column type="index" header-align="center" align="center" width="50" />
        <el-table-column prop="title" label="标题" header-align="center" />
        <el-table-column prop="score" label="分值" width="50" header-align="center" align="center" />
        <el-table-column prop="answer" label="答案" width="50" header-align="center" align="center" />
        <el-table-column prop="summary" label="信息" header-align="center" />
        <el-table-column prop="group_ids" label="选项" align="left" width="250">
          <template slot-scope="scope">
            <el-radio
              v-for="(item,index) in scope.row.choose"
              :key="index"
              disabled
              :label="item.key"
            >{{ item.key }} {{ item.summary }}</el-radio>
          </template>
        </el-table-column>
        <el-table-column prop="create_time" label="创建时间" header-align="center" align="center" />
        <el-table-column label="操作" fixed="right" header-align="center" align="center" width="150">
          <template slot-scope="scope">
            <el-button
              type="success"
              size="mini"
              :disabled="false"
              @click="addOrUpdateHandle(scope.row.id)"
            >修改</el-button>
            <el-button type="danger" size="mini" @click="deleteHandle(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList" />

    <!-- 分页 -->
    <!-- <el-pagination
      background
      slot="footer"
      :current-page="page"
      :page-sizes="[30, 50, 100]"
      :page-size="limit"
      :total="total"
      layout="total, sizes, prev, pager, next, jumper"
      @size-change="pageSizeChangeHandle"
      @current-change="pageCurrentChangeHandle"
    ></el-pagination>-->
  </div>
</template>

<script>
import Question from '@/model/question'
import AddOrUpdate from './question-add-or-update'
import mixinViewModule from '@/common/mixin/view-module'

export default {
  components: {
    AddOrUpdate,
  },
  mixins: [mixinViewModule],
  data() {
    return {
      mixinViewModuleOptions: {
        getDataListIsPage: true,
        getDataListModel: Question.getItems,
        deleteDataModel: Question.delectItem,
      },
      // 查询条件
      dataForm: {
        name: '',
      },
      // 数据列表
      dataList: [],
      tags: [],
    }
  },
  methods: {
    matchTag(tag_ids) {
      return this.tags.filter(item => tag_ids.includes(`${item.id}`))
    },
  },
}
</script>
<style lang="scss" scoped>
.el-tag {
  margin-bottom: 3px;
}
</style>
