# Tripful
여행 스케줄링 플랫폼

# FE
- .env파일 추가
> VUE_APP_KAKAOAPI={JAVASCRIPT_KEY}
- DB스키마에 TOKEN 칼럼 추가하기 
- User DTO에 token 추가하기
> ALTER TABLE user ADD `token` VARCHAR(1000) NULL DEFAULT NULL;
- User DTO에 platformType 추가하기 (1:로컬 2:카카오 3:깃헙)
> ALTER TABLE user ADD `platformType` int DEFAULT 1;

1. npm install
2. npm run serve

# BE
