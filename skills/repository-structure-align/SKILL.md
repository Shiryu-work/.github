---
name: repository-structure-align
description: 既存リポジトリの責務を現在の構造へ収束させ、旧パス・重複管理元・汎用収納ルートを解消するときに使う。
---

# リポジトリ構成整合

物理構造は `開発/構成規約.md`、判断の責務関係は `開発/判断構造.md` を管理元とします。このSkillは移行操作だけを持ちます。

## 入力

- 現在の依頼・Issue・PR
- 作業ブランチの構成
- 変更対象に最も近い `AGENTS.md`
- 移動対象の現在内容と利用側
- 関係する外部契約

## 手順

1. 既存ファイル・ディレクトリの現在の責務を確認する。
2. `開発/構成規約.md` に従い、移動先を決める。
   - `scripts/` や `処理/` という形式名だけで実行物をまとめない。
   - runtime、生成、決定的検証、read-only状態導出、開発環境adapter等、実際のownershipとconsumer lifecycleを確認する。
   - unit / release testが実装moduleと同じownershipを持つ場合はco-locationも候補にする。
3. generatorやgenerated artifactを扱う場合、実consumerを確認する。
   - source manifest、generator、generated projectionを別責務として扱う。
   - `catalog` は実際に一覧・探索・取得へ使うcatalog artifactに限定し、generator全体の名前は生成する配布物・projectionのconsumer責務で決める。
4. 現在仕様・履歴・移行元を分け、履歴だけの理由で旧現在pathを残さない。
5. pathらしい値や識別子が、内部locator、stable identity、external contractのどれかを実際のconsumerから確認する。
   - 公開面や生成物へ出力されること、IDとして存在することだけでstableとは扱わない。
   - 独立consumer、第三者参照、external protocol、永続保存済み参照、変更側だけで同時更新できない契約がある場合はstable identityとして保護する。
   - Draft中、停止中、同一ownerでproducerとconsumerを同時更新できる場合は、存在だけを互換維持の理由にしない。
6. 移動・改名し、AGENTS、README、link、loader、validator、generator、test、設定、manifest、workflow、build watch、運用手順等のconsumerを同じ変更で更新する。
7. 内部互換だけのalias・転送、旧path、重複管理元を削除する。
8. 変更範囲に必要な検証を行う。
