## SCP tutorial

Ubuntu에서 **SCP(Secure Copy)**를 테스트하기 위한 docker 컨테이너 입니다.
SCP를 테스트하기 위해서 2가지 컨테이너를 실행합니다.

## MainServer

먼저 **메인서버**를 빌드하고 시행합니다.

```
bash mainService.sh build && bash mainServer.sh start
```

## BackupServer

다음은 **백업서버**를 빌드하고 실행합니다. 백업서버는 **7022** 포트로 **sshd**가 실행됩니다.

```
bash backupServer.sh build ** bash backupServer.sh start
```

## SCP 테스트

**메인서버**가 실행되면 열리는 터미널에 들어가서 **백업서버**로 테스트 데이터 **/home/mainuser/data**를 복사합니다. 

```
scp -r /home/mainuser/data backupuser@backupServer:/home/backupuser/backup
```