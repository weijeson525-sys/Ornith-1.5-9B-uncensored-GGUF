# Ornith-1.5-9B-uncensored-GGUF — 公开资料镜像

这是 HuggingFace 仓库 [mradermacher/Ornith-1.5-9B-uncensored-GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF) 的**公开资料镜像**（模型卡 + 小文件 + 下载脚本）。本仓库**不含权重文件**。

- 来源（HF 原仓库）：https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF
- 榜单来源：AI探路者Tim X 帖 https://x.com/aiexplorertim/status/2118947309992260083（“全球下载量最高的 10 个无审查 AI 模型”）
- 核实日期：2026-11-09；模型卡抓取日期：2026-11-10
- 许可证：apache-2.0
- 门控状态：gated=false（HF 仓库本身不门控，可匿名下载，无须令牌）
- HF 下载量：约 174 万；创建：2026-08-20；修改：2026-11-04
- 许可证备注：Apache-2.0（HF cardData 核实）。基底 junafinity/Ornith-1.5-9B-uncensored（Qwen3.5-9B 系）。

## 权重文件不在本仓库

GitHub 单文件上限 100MB，本仓库最小量化也要几 GB（首选量化见下），放不下。请用本仓库的 `download.sh` 从 HuggingFace 拉取权重：

```bash
./download.sh            # 默认下载首选量化 Q4_K_M（5.63 GB）
./download.sh Q5_K_M     # 下载指定量化
./download.sh --list     # 列出全部可用量化与大小
./download.sh --mmproj   # 另下载 mmproj（视觉用，可选）
```

## 量化

- 首选量化：**Q4_K_M** — `Ornith-1.5-9B-uncensored.Q4_K_M.gguf`，5.63 GB
- 备用量化：Q2_K 3.83GB; Q3_K_S 4.26GB; IQ4_XS 5.23GB; Q4_K_S 5.35GB; Q5_K_M 6.47GB; Q8_0 9.53GB
- 另有 mmproj Q8_0 0.62GB / f16 0.92GB（可选，视觉用）。

### 全部量化（HF 文件树实测，字节数与 sha256 为 HF LFS oid）

| 文件 | 量化 | 大小 | sha256 (LFS oid) |
|---|---|---:|---|
| `Ornith-1.5-9B-uncensored.Q2_K.gguf` | Q2_K | 3.83 GB | `4db5a3939119b4c5e2e1c992ddb9d42ff0f3cf725e454cdda97ced8e158244bb` |
| `Ornith-1.5-9B-uncensored.Q3_K_S.gguf` | Q3_K_S | 4.26 GB | `5c85e5e72b3b9e8d9854e743a81f1e1da84998a7a3997f8c0cbb9a551c42ba62` |
| `Ornith-1.5-9B-uncensored.Q3_K_M.gguf` | Q3_K_M | 4.62 GB | `c9a221d5b86a092520a08f83dce16ee747fc338eb1a553ed8df26b001c8a1183` |
| `Ornith-1.5-9B-uncensored.Q3_K_L.gguf` | Q3_K_L | 4.93 GB | `c3353f9cae3d9b874dcdba39220d6a0206b8ba435ef19152363000a451b09aba` |
| `Ornith-1.5-9B-uncensored.IQ4_XS.gguf` | IQ4_XS | 5.23 GB | `a118b27b0522b65a0c80fb3bb5fb271d4025a8c745799287ac3192f34630cd5a` |
| `Ornith-1.5-9B-uncensored.Q4_K_S.gguf` | Q4_K_S | 5.35 GB | `82cb794ba63c12e33a384e366fb594270fda167143a9a47365598bfa93ddc832` |
| `Ornith-1.5-9B-uncensored.Q4_K_M.gguf` | Q4_K_M | 5.63 GB | `ee180b66bc2dcd49f41e0d3c991d2eaab3078d651d97595852d16ae6d9af3c9e` |
| `Ornith-1.5-9B-uncensored.Q5_K_S.gguf` | Q5_K_S | 6.31 GB | `dc2d9b5fb6b9a007739f1e35f7efe878c42fc80e09b4549582ba390474e67237` |
| `Ornith-1.5-9B-uncensored.Q5_K_M.gguf` | Q5_K_M | 6.47 GB | `7f06a0e1da5103610153d1533ea9d75ab5e688acc44aa49391377188dbf2e203` |
| `Ornith-1.5-9B-uncensored.Q6_K.gguf` | Q6_K | 7.36 GB | `5d48d49aae8aa7cb415e2cc4989457a094ff5a13bbb425222f1450abcd6cf1b8` |
| `Ornith-1.5-9B-uncensored.Q8_0.gguf` | Q8_0 | 9.53 GB | `05e0878744b36b7c55385ecb8aaf47bddf0b43f720dbfac5c79e489c02abca8f` |
| `Ornith-1.5-9B-uncensored.f16.gguf` | f16 | 17.92 GB | `0c63472360579233eff2a90f01888ba72baac6e538cd91c59a34ff3b7e7ab42f` |

### mmproj（视觉 / 多模态补充文件，可选）

| 文件 | 大小 | sha256 (LFS oid) |
|---|---:|---|
| `Ornith-1.5-9B-uncensored.mmproj-Q8_0.gguf` | 0.62 GB | `aa9d85f3e01af1fc776a1d5d18dfd27b1802676ee3abe4e6f8b449d8da374a8b` |
| `Ornith-1.5-9B-uncensored.mmproj-f16.gguf` | 0.92 GB | `3170dd53d7ed442c944cfb378535e96a5981283d65ec4f6c389f07999f32b380` |

---

下面是 HF 原仓库模型卡原文（开头的 YAML frontmatter 已去掉，其余逐字照录）。

## About

<!-- ### quantize_version: 2 -->
<!-- ### output_tensor_quantised: 1 -->
<!-- ### convert_type: hf -->
<!-- ### vocab_type:  -->
<!-- ### tags:  -->
<!-- ### quants:  x-f16 Q4_K_S Q2_K Q8_0 Q6_K Q3_K_M Q3_K_S Q3_K_L Q4_K_M Q5_K_S Q5_K_M IQ4_XS -->
<!-- ### quants_skip:  -->
<!-- ### skip_mmproj:  -->
static quants of https://huggingface.co/junafinity/Ornith-1.5-9B-uncensored

<!-- provided-files -->

***For a convenient overview and download list, visit our [model page for this model](https://hf.tst.eu/model#Ornith-1.5-9B-uncensored-GGUF).***

weighted/imatrix quants are available at https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-i1-GGUF
## Usage

If you are unsure how to use GGUF files, refer to one of [TheBloke's
READMEs](https://huggingface.co/TheBloke/KafkaLM-70B-German-V0.1-GGUF) for
more details, including on how to concatenate multi-part files.

## Provided Quants

(sorted by size, not necessarily quality. IQ-quants are often preferable over similar sized non-IQ quants)

| Link | Type | Size/GB | Notes |
|:-----|:-----|--------:|:------|
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.mmproj-Q8_0.gguf) | mmproj-Q8_0 | 0.7 | multi-modal supplement |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.mmproj-f16.gguf) | mmproj-f16 | 1.0 | multi-modal supplement |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.Q2_K.gguf) | Q2_K | 3.9 |  |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.Q3_K_S.gguf) | Q3_K_S | 4.4 |  |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.Q3_K_M.gguf) | Q3_K_M | 4.7 | lower quality |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.Q3_K_L.gguf) | Q3_K_L | 5.0 |  |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.IQ4_XS.gguf) | IQ4_XS | 5.3 |  |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.Q4_K_S.gguf) | Q4_K_S | 5.5 | fast, recommended |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.Q4_K_M.gguf) | Q4_K_M | 5.7 | fast, recommended |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.Q5_K_S.gguf) | Q5_K_S | 6.4 |  |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.Q5_K_M.gguf) | Q5_K_M | 6.6 |  |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.Q6_K.gguf) | Q6_K | 7.5 | very good quality |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.Q8_0.gguf) | Q8_0 | 9.6 | fast, best quality |
| [GGUF](https://huggingface.co/mradermacher/Ornith-1.5-9B-uncensored-GGUF/resolve/main/Ornith-1.5-9B-uncensored.f16.gguf) | f16 | 18.0 | 16 bpw, overkill |

Here is a handy graph by ikawrakow comparing some lower-quality quant
types (lower is better):

![image.png](https://www.nethype.de/huggingface_embed/quantpplgraph.png)

And here are Artefact2's thoughts on the matter:
https://gist.github.com/Artefact2/b5f810600771265fc1e39442288e8ec9

## FAQ / Model Request

See https://huggingface.co/mradermacher/model_requests for some answers to
questions you might have and/or if you want some other model quantized.

## Thanks

I thank my company, [nethype GmbH](https://www.nethype.de/), for letting
me use its servers and providing upgrades to my workstation to enable
this work in my free time.

<!-- end -->
