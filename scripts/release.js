const { readFileSync, unlinkSync } = require("fs");
const { join } = require("path");
const { execSync } = require("child_process");
require("dotenv").config();

const packageJsonPath = join(__dirname, "..", "package.json");
const packageJsonRaw = readFileSync(packageJsonPath, "utf8");
const packageJson = JSON.parse(packageJsonRaw);
const version = packageJson.version;
const buildName = `No Stealth Meter ${version}.7z`;

try {
  unlinkSync(buildName);
} catch (e) {
  // Expected behaviour if it doesn't exist.
}

const ba2Name = process.env.NO_STEALTH_METER_BA2;
execSync(
  `.\\node_modules\\7z-bin\\win32\\7z.exe a ".\\dist\\${buildName}" ".\\dist\\${ba2Name}"`,
);
