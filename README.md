# MYGO圖包API

你願意一輩子跟我一起MyGo嗎？
[API Swagger Docs](https://mygoapi.miyago9267.com/docs)

本 fork 純粹調整了部分參數，方便支援 Github Action 與 Package 以更懶人的開箱即用 Docker
可以直接拉取 ghcr.io/poropsk/mygo-api 並映射 Container Port: 3030 至所需 PORT 即可執行

## 部署

### 環境變數

僅有設定啟動PORT 預設為3030

### 安裝及啟動

```bash
git clone https://github.com/miyago9267/mygoapi.git && cd mygoapi
poetry install
poetry run python3 mygo/app.py
```

## License

本專案採MIT License
歡迎fork進行修改、PR、二次開發
