# paasta-eclipse-che-release

##1. WEB-IDE Configuration
- paasta-web-ide1 :: 1 machine
- paasta-web-ide2 :: 1 machine

##2. Deploy
>`$ cd $BOSH_RELEASE_DIR`<br>
>`$ bosh deployment paasta_web_ide_vsphere_2.0.yml`<br>
>`$ bosh deploy`

#Github에 100MB 이상의 파일 push & clone 받기<br>
<br>
##1. git-lfs 적용<br>
Commit 과정에서 지정한 파일을 작게 조각내주는 Git extension인 git-lfs — [Git Large File Storage](https://git-lfs.github.com) — 를 로컬에 설치한 뒤, 적용하려는 Repository 경로에서 다음 명령을 실행한다.<br>

>`$ git lfs install`
>`Updated pre-push hook.`
>`Git LFS initialized.`

그다음 용량이 큰 파일을 git-lfs의 관리 대상으로 등록해준다. 다음 예시는 120MB 정도의 exe 파일을 Stage에 추가한 상황에서, 확장자가 exe인 모든 파일을 git-lfs의 관리 대상으로 지정하고 Commit을 수행한 모습이다.<br>

>`$ git lfs track “*.exe”`<br>
>`Tracking *.exe`<br>
>`$ git commit -m “Large file included”`<br>
>`[master (root-commit) dd2b715] Large file included`<br>
>`(...)`<br>

##2. git-lfs push <br>
위 과정들을 적용한 뒤 push를 시도하면 다음과 같이 성공 메시지를 볼 수 있다.<br>
<br>
>`$ git push`<br>
>`Counting objects: 3089, done.`<br>
>`Delta compression using up to 4 threads.`<br>
>`Compressing objects: 100% (1809/1809), done.`<br>
>`Writing objects: 100% (3089/3089), 234.95 MiB | 1.30 MiB/s, done.`<br>
>`Total 3089 (delta 1236), reused 2890 (delta 1229)`<br>
>`To git@github.com:***`<br>
>` * [new branch] master -> master`<br>
>` * [new branch] *** -> ***`<br>

##2. git-lfs clone <br>
git-lfs를 이용해 clone 한다.
<br>
>`$ git lfs clone https://github.com/OpenPaaSRnD/openpaas-service-release.git`<br>
