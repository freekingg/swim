<template>
  <el-dialog
    :visible.sync="visible"
    :title="!dataForm.id ? '添加' : '修改'"
    :close-on-click-modal="false"
    :close-on-press-escape="false"
  >
    <el-form
      :model="dataForm"
      ref="dataForm"
      @keyup.enter.native="dataFormSubmitHandle"
      label-width="120px"
    >
      <el-form-item prop="name" label="手机">
        <el-input v-model="dataForm.phone" disabled />
      </el-form-item>

      <el-form-item prop="name" label="教练">
        <el-input v-model="dataForm.name" disabled />
      </el-form-item>

      <el-form-item prop="score" label="分值">
        <el-input v-model="dataForm.score" disabled />
      </el-form-item>

      <el-form-item prop="choose" label="答题情况">
        <div v-for="(item,index) in dataForm.extend" :key="index">
          <span>{{ item.title }}</span>
          <el-radio disabled :label="item.key">{{ item.myAnswer }}</el-radio>
        </div>
      </el-form-item>
    </el-form>

    <template slot="footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmitHandle">确认</el-button>
    </template>
  </el-dialog>
</template>

<script>
import Exam from '@/model/exam'

export default {
  data() {
    return {
      visible: false,
      dialogFormVisible: false,
      dataForm: {
        id: '',
        name: '',
        score: 1,
        choose: [],
      },
      loading: false,
    }
  },
  methods: {
    init() {
      this.visible = true
      this.$nextTick(async () => {
        this.$refs.dataForm.resetFields()

        if (this.dataForm.id) {
          const info = await Exam.getItem(this.dataForm.id)
          info.extend = JSON.parse(info.extend)
          console.log(info)
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
            await Exam.createItem(this.dataForm)
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
            await Exam.editItem(this.dataForm.id, this.dataForm)
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
    async delChoose(item) {},
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
