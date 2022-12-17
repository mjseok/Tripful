import api from "./http";

//게시글 리스트 가져오기
function boardList(pgno, success, fail) {
  console.log(pgno);
  api.get(`board/community/list/${pgno}`).then(success).catch(fail);
}

//게시글 하나 가져오기
function getBoard(boardid, success, fail) {
  console.log("community 번호"+boardid);
  console.log(boardid);
  api.get(`board/community/${boardid}`).then(success).catch(fail);
}
//게시글 작성하기
function writeBoard(board, success, fail) {
  api
    .post(`board/community/register`, JSON.stringify(board))
    .then(success)
    .catch(fail);
}
//게시글 수정하기
function modifyBoard(board, success, fail) {
  // console.log(boardid);
  api
    .post(`board/community/modify`, JSON.stringify(board))
    .then(success)
    .catch(fail);
}
//게시글 삭제하기
function deleteBoard(boardid, success, fail) {
  console.log(boardid);
  api.post(`board/community/delete`, boardid).then(success).catch(fail);
}

//공지사항 작성하기
function writeNotice(board, success, fail) {
  api
    .post(`board/notice/register`, JSON.stringify(board))
    .then(success)
    .catch(fail);
}
//공지사항 리스트 가져오기
function noticeList(pgno, success, fail) {
  api.get(`board/notice/list/${pgno}`).then(success).catch(fail);
}
//공지사항 하나 가져오기
function getNotice(noticeid, success, fail) {
  console.log("공지사항 번호"+noticeid);
  api.get(`board/notice/${noticeid}`).then(success).catch(fail);
}
//공지사항 수정하기
function modifyNotice(notice, success, fail) {
  // console.log(boardid);
  api
    .post(`board/notice/modify`, JSON.stringify(notice))
    .then(success)
    .catch(fail);
}
//공지사항 삭제하기
function deleteNotice(noticeid, success, fail) {
  console.log(noticeid);
  api.post(`board/notice/delete`, noticeid).then(success).catch(fail);
}
export {
  boardList,
  noticeList,
  getBoard,
  modifyBoard,
  writeBoard,
  deleteBoard,
  writeNotice,
  getNotice,
  modifyNotice,
  deleteNotice,
};
