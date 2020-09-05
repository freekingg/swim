<template>
  <el-dialog
    :visible.sync="visible"
    :title="!dataForm.id ? '添加' : '修改'"
    :close-on-click-modal="false"
    :close-on-press-escape="false"
  >
    <el-form
      :model="dataForm"
      :rules="dataRule"
      ref="dataForm"
      @keyup.enter.native="dataFormSubmitHandle"
      label-width="120px"
    >
      <el-form-item prop="title" label="标题">
        <el-input v-model="dataForm.title" />
      </el-form-item>

      <el-form-item prop="score" label="分值">
        <el-input v-model="dataForm.score" />
      </el-form-item>

      <el-form-item prop="choose" label="选项">
        <div v-for="(item,index) in dataForm.choose" :key="index">
          <el-radio disabled :label="item.key">{{ item.key }} {{ item.summary }}</el-radio>
          <i class="el-icon-delete" @click="delChoose(item)"></i>
        </div>
        <el-button
          v-if="dataForm.choose.length < 4"
          type="primary"
          size="mini"
          @click="dialogFormVisible = true"
        >添加选项</el-button>
      </el-form-item>

      <el-form-item prop="answer" label="答案">
        <el-radio v-model="dataForm.answer" label="A">A</el-radio>
        <el-radio v-model="dataForm.answer" label="B">B</el-radio>
        <el-radio v-model="dataForm.answer" label="C">C</el-radio>
        <el-radio v-model="dataForm.answer" label="D">D</el-radio>
      </el-form-item>

      <el-form-item label="简介">
        <el-input
          size="medium"
          type="textarea"
          :autosize="{ minRows: 4, maxRows: 8 }"
          placeholder="请输入简介"
          v-model="dataForm.summary"
        ></el-input>
      </el-form-item>
    </el-form>

    <el-dialog
      append-to-body
      title="选项"
      :visible.sync="dialogFormVisible"
      :close-on-click-modal="false"
      :close-on-press-escape="false"
    >
      <el-form :model="chooseform" ref="chooseform" :rules="dataChooseRule">
        <el-form-item label="选项名称" prop="key">
          <el-input v-model="chooseform.key" placeholder="请输入A,B,C,D"></el-input>
        </el-form-item>
        <el-form-item label="选项内容" prop="summary">
          <el-input v-model="chooseform.summary" placeholder="请输入选项内容"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="chooseformSubmitHandle">确 定</el-button>
      </div>
    </el-dialog>

    <template slot="footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmitHandle">确认</el-button>
    </template>
  </el-dialog>
</template>

<script>
import Question from '@/model/question'
import QuestionChoose from '@/model/questionChoose'

export default {
  data() {
    return {
      visible: false,
      dialogFormVisible: false,
      dataForm: {
        id: '',
        title: '',
        score: 1,
        answer: 'A',
        choose: [],
        summary: '',
      },
      chooseform: {
        key: '',
        summary: '',
      },
      dataRule: {
        title: [{ required: true, message: '请输入标题', trigger: 'blur' }],
        score: [{ required: true, message: '请输入分值', trigger: 'blur' }],
      },
      dataChooseRule: {
        key: [{ required: true, message: '请输入标题', trigger: 'blur' }],
        summary: [{ required: true, message: '请输入内容', trigger: 'blur' }],
      },
      loading: false,
      tags: [],
    }
  },
  methods: {
    init() {
      this.visible = true
      this.$nextTick(async () => {
        this.$refs.dataForm.resetFields()

        if (this.dataForm.id) {
          const info = await Question.getItem(this.dataForm.id)
          this.dataForm = info
        }
      })
    },

    resetForm(formName) {
      this.$refs[formName].resetFields()
      this.$refs.groupPermissions.getGroupPermissions()
    },
    // 表单提交
    async dataFormSubmitHandle() {
      this.$refs.dataForm.validate(async valid => {
        if (!valid) {
          // this.$message.error('请将信息填写完整')
          return false
        }
        console.log(this.dataForm)
        if (!this.dataForm.id) {
          try {
            this.loading = true
            await Question.createItem(this.dataForm)
            this.$message({
              message: '添加成功',
              type: 'success',
              duration: 500,
              onClose: () => {
                this.visible = false
                this.$emit('refreshDataList')
              },
            })
          } catch (e) {
            this.loading = false
            console.log(e)
          }
        } else {
          try {
            this.loading = true
            await Question.editItem(this.dataForm.id, this.dataForm)
            this.$message({
              message: '修改成功',
              type: 'success',
              duration: 500,
              onClose: () => {
                this.visible = false
                this.$emit('refreshDataList')
              },
            })
          } catch (e) {
            this.loading = false
            console.log(e)
          }
        }
      })
    },
    async delChoose(item) {
      if (item.id === 0 || item.id) {
        await QuestionChoose.delectItem(item.id)
        const r = this.dataForm.choose.findIndex(it => it === item)
        if (r !== -1) {
          this.dataForm.choose.splice(r, 1)
        }
      } else {
        const r = this.dataForm.choose.findIndex(it => it === item)
        if (r !== -1) {
          this.dataForm.choose.splice(r, 1)
        }
      }
    },
    chooseformSubmitHandle() {
      this.$refs.chooseform.validate(async valid => {
        if (!valid) {
          return false
        }
        this.dataForm.choose.push(JSON.parse(JSON.stringify(this.chooseform)))
        this.$refs.chooseform.resetFields()
        this.dialogFormVisible = false
      })
    },
    handleSuccessImage(response, file, fileList) {
      console.log(response, file, fileList)
      this.dataForm.image = response[0].url
    },
    handleSuccessVideo(response, file, fileList) {
      console.log(response, file, fileList)
      this.dataForm.video = response[0].url
    },
  },
}
</script>
<style scoped>
.el-icon-delete {
  cursor: pointer;
}
</style>
