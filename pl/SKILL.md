---
name: pl
description: 启动一个新的规划。
disable-model-invocation: true
---

启动一个新的规划。

**输入**：用户的请求应当包含变更名称（kebab-case）或对想要构建内容的描述。

**步骤**

1. **如果没有提供明确的输入，询问用户想要构建什么**
   使用 **AskUserQuestion Tool**（开放式，无预设选项）询问：
   > "您想要进行什么规划？请描述您想要构建或修复的内容。"

   根据他们的描述，提炼出简洁的中文规划主题（例如：检索列表页）。

2. **创建新规划**
   调用 `bash ~/.claude/skills/pl/scripts/pl-init.sh` 脚本，传入规划名称以创建新的规划文件。

## 要求
- 本技能仅支持创建新规划，不处理已有规划的读取或修改。
- 新规划必须通过 `bash ~/.claude/skills/pl/scripts/pl-init.sh` 脚本创建。
- 禁止覆盖现有规划文件。
