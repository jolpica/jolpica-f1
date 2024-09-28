import { danger, fail, markdown } from "danger";

const prBody = danger.github.pr.body;

const checkboxRegex = /- \[x\] I have read and agreed to the \[?contributing guidelines\]?/i;
const unitTestsCheckboxRegex = /- \[x\] Unit tests for the changes are included in this PR\./i;


if (!checkboxRegex.test(prBody)) {
  fail("Please confirm you have read and agreed to the contributing guidelines in the PR description.");
  markdown(
    "🔔 Please check the checkbox in the PR template to indicate you've read and agreed to the contributing guidelines before submitting your PR."
  );
}

const pythonFiles = danger.git.modified_files.concat(danger.git.created_files).filter(file => file.endsWith(".py"));

if (pythonFiles.length > 0 && !unitTestsCheckboxRegex.test(prBody)) {
  fail("Please confirm that unit tests for the code changes are included in this PR.");
}
