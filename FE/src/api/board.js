import api from "./http";

//게시글 리스트 가져오기
function boardList(pgno, success, fail) {
  console.log(pgno);
  api.get(`board/community/list/${pgno}`).then(success).catch(fail);
}
function noticeList(pgno, success, fail) {
  api.get(`board/notice/list/${pgno}`).then(success).catch(fail);
}

//게시글 하나 가져오기
function getBoard(boardid, success, fail) {
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
export {
  boardList,
  noticeList,
  getBoard,
  modifyBoard,
  writeBoard,
  deleteBoard,
};
