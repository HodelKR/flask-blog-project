# 파이썬 3.10 버전의 공식 이미지를 기반으로 시작합니다.
FROM python:3.10-slim

# 작업 디렉터리를 /app으로 설정합니다.
WORKDIR /app

# 현재 디렉터리의 requirements.txt 파일을 컨테이너의 /app 디렉터리로 복사합니다.
COPY requirements.txt .

# requirements.txt에 명시된 모든 파이썬 패키지를 설치합니다.
RUN pip install --no-cache-dir -r requirements.txt

# 현재 디렉터리의 모든 나머지 파일들을 컨테이너의 /app 디렉터리로 복사합니다.
COPY . .

# Flask 애플리케이션이 5000번 포트를 사용하도록 설정합니다.
EXPOSE 5000

# 컨테이너가 시작될 때 실행될 명령어입니다.
# gunicorn을 사용해 Flask 앱을 실행합니다. (성능 및 안정성 향상)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]