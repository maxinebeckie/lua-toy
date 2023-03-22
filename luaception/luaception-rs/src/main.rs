use mlua::prelude::*;

use std::fs;

fn main() -> LuaResult<()> {
    let lua = Lua::new();

    let code = fs::read_to_string("code").expect("failed to read code file");
    lua.load(&code).exec()?;

    std::process::Command::new("rm code").output().expect("failed to remove temporary code file");
    Ok(())
}
