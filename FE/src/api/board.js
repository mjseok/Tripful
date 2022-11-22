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

//게시글 작성하기

//게시글 수정하기

//게시글 삭제하기

export { boardList, noticeList };
