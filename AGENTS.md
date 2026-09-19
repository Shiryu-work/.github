# Shiryu-work GitHub共通設定ルーター

このRepositoryは `Shiryu-work` Organizationの公開GitHub共通設定とprojectionだけを管理します。

## 常時ルール

- Repositoryの責務と現行運用は `README.md` を読む。
- `.github/ISSUE_TEMPLATE/` はOrg共通Issue入力UIのprojectionとして扱う。
- Issue成果型・title接頭辞・必須見出し・親子意味は `Shiryu-work/template` の `開発/Issue運用.md` / `開発/Issue形式.json` / `開発/Issue親子.json` を意味authorityとする。
- branchとRepository-level GitHub Actions policyは `Shiryu-work/template` の `開発/ブランチ運用.md` / `開発/GitHub Actions.md` を参照する。
- Organization settingsの実値はGitHub側の設定実体がcurrent stateであり、このRepositoryへ第二台帳として複製しない。
- self-hosted runnerのmachine provisioning・registration・service保守は `Shiryu-work/.github-private` の非公開運用責務とする。
- Product固有の仕様・設計・実装規約・AI向け文脈・validator実装をここへ複製しない。
- Product固有作業では対象Repositoryの `AGENTS.md` を入口にする。
- 実行していない確認やprojection更新を完了扱いしない。
