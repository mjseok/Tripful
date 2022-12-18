<template>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-header">
            <slot name="header">
              <h3>나의 스케줄</h3>
            </slot>
          </div>

          <div class="modal-body">
            <slot name="body">
              <form method="POST" id="register-form">
                <input type="hidden" name="act" value="register" />
                <div class="row">
                  <div class="col-10">
                    제목 :
                    <input
                      type="text"
                      id="title"
                      name="title"
                      style="width: 90%"
                    />
                  </div>
                  <div class="col">
                    <select
                      class="form-select"
                      form="register-form"
                      name="theme"
                    >
                      <option value="food">먹방</option>
                      <option value="activity">액티비티</option>
                      <option value="healing">힐링</option>
                    </select>
                  </div>
                </div>
                <div class="row" id="spot-group">
                  <div
                    class="card col"
                    v-for="item in scheduleSpot"
                    :key="item.spot.sotid"
                    style="max-width: 160px"
                  >
                    <img
                      :src="item.spot.image"
                      class="card-img-top"
                      alt="2"
                      style="height: 100px"
                    />
                    <div class="card-body">
                      <p class="card-title">{{ item.spot.title }}</p>
                    </div>
                  </div>
                </div>
              </form></slot
            >
          </div>

          <div class="modal-footer">
            <slot name="footer">
              <button type="button" class="btn-solid-sm p-4" id="btn-register">
                등록하기
              </button>
              <button class="modal-default-button" @click="$emit('close')">
                OK
              </button>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  name: "AppModal",
  props: ["scheduleSpot"],
};
</script>

<style>
#spot-group {
  margin-top: 30px;
  margin-left: 10px;
}
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: table;
  transition: opacity 0.3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
  width: 1000px;
  margin: 0px auto;
  padding: 20px 30px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.33);
  transition: all 0.3s ease;
  font-family: Helvetica, Arial, sans-serif;
}

.modal-header h3 {
  margin-top: 0;
  color: #42b983;
}

.modal-body {
  margin: 20px 0;
}

.modal-default-button {
  float: right;
}

/*
 * The following styles are auto-applied to elements with
 * transition="modal" when their visibility is toggled
 * by Vue.js.
 *
 * You can easily play with the modal transition by editing
 * these styles.
 */

.modal-enter {
  opacity: 0;
}

.modal-leave-active {
  opacity: 0;
}

.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
</style>
