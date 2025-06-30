# ---- Builder Stage ----
# 使用官方 Python 3.12 slim 映像檔作為建置環境
FROM python:3.12-slim as builder

# 設定工作目錄
WORKDIR /app

# 安裝 poetry
RUN pip install poetry

# 複製相依性定義檔
COPY pyproject.toml poetry.lock ./

# 安裝專案相依性，但不建立虛擬環境
# --without dev: 不安裝開發用的套件
RUN poetry config virtualenvs.create false && \
    poetry install --without dev

# ---- Final Stage ----
# 使用相同的 Python 3.12 slim 映像檔作為最終環境
FROM python:3.12-slim

# 設定工作目錄
WORKDIR /app

# 從 builder 階段複製已安裝的套件
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# 複製應用程式原始碼
COPY ./mygo ./mygo

# 您的 app.py 使用 3030 作為預設 port
ENV SERVER_PORT=3030

# 對外開放 port
EXPOSE 3030

# 啟動應用程式的指令
# 使用 mygo.app:app 來指定 FastAPI 實例的位置
CMD ["uvicorn", "mygo.app:app", "--host", "0.0.0.0", "--port", "3030"]