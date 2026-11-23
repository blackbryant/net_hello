# HelloWorld (.NET 10 Blazor WebAssembly)

使用 .NET 10 建立的 Hello World 網頁，透過 GitHub Actions 自動部署到 GitHub Pages。

## 本機執行

```bash
dotnet run --project src/HelloWorld
```

## 部署

推送到 `main` 分支後，`.github/workflows/deploy.yml` 會自動建置並部署。
首次使用請到 repo 的 **Settings → Pages → Source** 選擇 **GitHub Actions**。
