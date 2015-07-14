## Ubuntu에서 Postfix와 gmail로 메일 발송하기

Postfix를 설치하고 gmail로 메일을 발송하기 위한 우분투 서버 컨테이너 입니다.

## 파일 설명

- **Dockerfile** : 도커 이미지 파일
- **main.cf** : **Postfix** 설정 파일로 필요시 수정하여 사용합니다.
- **sasl_passwd** : **gmail계정**에 관련된 보안파일로 gmail계정과 비밀번호를 수정하여 사용합니다.
- **alias** : 서버 root의 메일을 **gmail**로 받아볼 수 있습니다. gmail계정을 수정하여 사용합니다.

## 빌드

- **saltfactory/postfix** 이미지 이름을 변경하여 사용합니다.

```
docker build saltfactory/postfix .
```

## 실행

- **demo-postfix** 컨테이너 이름을 변경하여 사용합니다.
- **saltfactory/postfix** 이미지 이름을 변경하여 사용합니다.

다음 실행은 컨테이너 안으로 bash로 터미널에 들어가는 명령어입니다.

```
docker run --name=demo-postfix -h demopostfix -it saltfactory/postfix bash
```

터미널이 열리면 **rsyslog**와 **postfix**를 실행합니다.

```
/etc/init.d/rsyslog start
```
```
/etc/init.d/postfix start
```

## 중지 및 삭제

```
docker stop demo-postfix && docker rm demo-postfix
```
