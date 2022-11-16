<template>
  <div>
    <div class="container" style="min-height: 750px">
      <div style="height: 70px"></div>
      <h2 class="text-center mt-5 mb-3">로그인</h2>

      <div class="d-flex p-3 m-3 justify-content-center align-items-center">
        <form
          class="text-center"
          id="login-form"
          method="POST"
          style="width: 45%"
        >
          <input
            type="text"
            class="login-form-item form-control border rounded-5 p-3"
            id="login-form-id"
            name="id"
            placeholder="아이디"
          />
          <input
            type="password"
            class="login-form-item form-control border rounded-5 p-3"
            id="login-form-pw"
            name="pwd"
            placeholder="비밀번호"
          />
          <button
            type="button"
            class="btn btn-solid-lg me-2 mt-3 mb-4 w-100"
            id="btn-login"
          >
            로그인
          </button>
          <br />
          <div class="mt-3">
            <a class="login-options" href="${root}/user/signUp">회원 가입 </a> |
            <a class="login-options" href="${root}/user/Find/id">아이디 찾기</a>
            |
            <a class="login-options" href="${root}/user/Find/pwd"
              >비밀번호 찾기</a
            ><br />
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "UserLogin",
};
</script>

<style></style>
