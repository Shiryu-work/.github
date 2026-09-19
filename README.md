# Shiryu-work GitHub共通設定

このRepositoryは、`Shiryu-work` Organization配下へ適用する公開GitHub共通設定とUI projectionを管理します。

AI / agentで扱う場合は最初に `AGENTS.md` を読みます。

## 管理対象

- `.github/ISSUE_TEMPLATE/` — Org共通Issue入力template。
- `README.md` / `AGENTS.md` — このRepositoryの責務とrouting。

Productの仕様・設計・実装規約、Template baseline本文、validator実装、runner秘密情報はここへ複製しません。

## Issue template

Org共通Issue templateは入力補助のprojectionです。成果型、title接頭辞、必須見出し、親子意味のauthoring originは `Shiryu-work/template` です。

参照先:

- `開発/Issue運用.md`
- `開発/Issue形式.json`
- `開発/Issue親子.json`

Template側の共通判断が変わった場合はfinite rolloutでこのprojectionを更新します。Template変更をruntimeで自動fetchするgeneric syncは前提にしません。

各Repositoryに独自の `.github/ISSUE_TEMPLATE` がある場合はそのRepository側がUI上優先されますが、Template由来Issue contractを採用しているRepositoryでは意味を矛盾させません。

## Organization設定

Organization Actions policy、Repository defaults、runner group等の実値はGitHub Organizationの設定実体がcurrent stateです。このRepositoryへ値を第二台帳として転記しません。

Repository-levelのGitHub Actions security / operation contractは `Shiryu-work/template` の `開発/GitHub Actions.md` / `開発/GitHub Actions規約.json` がauthoring originです。Organization側では利用可能なsettingをenforcementとして適用します。

self-hosted runnerのmachine provisioning、registration tokenの扱い、service保守、private runner metadataは `Shiryu-work/.github-private` が管理します。

## branch / PR

通常開発のbranch意味と標準名は `Shiryu-work/template` の `開発/ブランチ運用.md` を参照します。

GitHub上のApprove reviewをOrg共通の形式的必須gateにはしません。各Repositoryで必要な決定的検証と変更固有の追加確認が済んでいることを優先します。CI成功を文章・意味・安全性等の保証へ読み替えません。

## label

Organization Repository defaultsで管理する共通labelはGitHub側設定をcurrent stateとします。fileへ設定値を複製して同期元にしません。

## 可視性

Org共通Issue templateをGitHubへ適用するため、このRepositoryはPublicです。private infrastructure情報はここへ置きません。
