# gitlab-ci-template

## Example 2

- Test and Lint: runs unit tests and lints in our code
- Build and Push: builds Docker image and pushes it to the ecr registry
- Staging Plan: outputs what changes are going to be made to the infrastructure
- Staging Apply: apply changes to the infrastructure
- Production Plan: same but for production env
- Production Apply: same but for production env
- Destroy: removes the infrastructure


Regular Expressions:

```if: '$CI_MERGE_REQUEST_TARGET_BRANCH_NAME =~ /^(master|production)$/ || $CI_COMMIT_BRANCH =~ /^(master|production)$/'```
significa che il job viene eseguito in seguito a una merge request o a una commit sui branch master o production

```$CI_COMMIT_BRANCH =~ /^(master|production)$/```
significa che il job viene eseguito solo in seguito a una commit sui branch master o production

Perchè staging e production plan/apply vengono fatti in sequenza? Perchè vogliamo che le modifiche vengano prima testate nel modo in cui verrebbero rese effettive in production

- manual: il job si attiva solo manualmente; lo stage compare nella pipeline ma non viene eseguito, deve essere l'utente a selezionarlo e cliccare su "run"