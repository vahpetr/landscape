# Landscape
IT landscape description tool based on Excalidraw

## Container launch

Use docker compose to build and run the UI. The application will be
available on [http://localhost:5000](http://localhost:5000/).

```bash
docker compose up --build landscape
```

## Local launch

### Windows preparation

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

### Install packages

```bash
npm install
```

### Create `.env.local`

```bash
REACT_APP_PROTO_JSON_HOST=""
REACT_APP_PROTO_JSON_PATH=""
REACT_APP_GITHUB_API_PRJ_URL=""
REACT_APP_GITLAB_API_PRJ_URL="https://gitlab.acme.dev/api/v4/projects/NNNN/"
REACT_APP_GITHUB_TOKEN=""
REACT_APP_GITLAB_TOKEN=""
```

### Start application

```bash
npm start NODE_ENV=local
```
