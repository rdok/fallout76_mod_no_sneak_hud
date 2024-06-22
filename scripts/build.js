const { join } = require("path");
const { existsSync } = require("fs");
const { execSync } = require("child_process");
require('dotenv').config()

const archive2Exe = join(
  __dirname,
  "../libraries/Quick Configuration v1.12.7/Archive2/Archive2.exe",
);
if (!existsSync(archive2Exe)) {
  throw new Error(
    `The Archive2 executable was not found at '${archive2Exe}'. Please download & extract the full contents from https://www.nexusmods.com/fallout76/mods/546?tab=files&file_id=13110.`,
  );
}

const srcPath = join(__dirname, "../src");
const ba2Name = process.env.NO_STEALTH_METER_BA2;

execSync(`"${archive2Exe}" "${srcPath}" -create="dist/${ba2Name}"`);
