<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
import { mapActions } from 'vuex'
import Vue from 'vue'

export default {
  data() {
    return {
      timer: null,
      eventBus: new Vue(),
    }
  },
  mounted() {
    document.getElementById('loader').style.display = 'none'
  },
  provide() {
    // eventBus挂载的事件： addGroup addUser
    return {
      eventBus: this.eventBus,
    }
  },
  methods: {
    ...mapActions(['loginOut']),
  },
}
</script>

<style lang="scss">
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;

  #nav {
    padding: 30px;

    a {
      font-weight: bold;
      color: #2c3e50;

      &.router-link-exact-active {
        color: #42b983;
      }
    }
  }

  input:-webkit-autofill,
  input:-webkit-autofill:hover,
  input:-webkit-autofill:focus,
  input:-webkit-autofill:active {
    transition-delay: 99999s;
    transition: color 99999s ease-out, background-color 99999s ease-out;
  }
}

.container {
  .title {
    height: 59px;
    line-height: 59px;
    color: $parent-title-color;
    font-size: 16px;
    font-weight: 500;
    text-indent: 40px;
    border-bottom: 1px solid #dae1ec;
  }

  .text-right {
    text-align: right;
    padding-right: 20px;
  }

  .wrap {
    padding: 20px;
    margin-bottom: 12px;
    background: #fff;
  }

  .submit {
    float: left;
  }
}
</style>
