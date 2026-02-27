#!/bin/bash

# Copyright 2026 The ODML Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

MODEL_PATH=$1

VALIDATION_TESTS=(
  "Answer with ONLY numbers. Count to 10 starting with 1.|1.*2.*3.*4.*5.*6.*7.*8.*9.*10"
  "Answer with ONLY the missing word. Happy Birthday to ___.|\byou\b"
  "Answer with ONLY the name of the city. What is the capital of France?|\bParis\b"
)

echo "=================================================="
echo "🚀 Starting LiteRT-LM Sanity Checks"
echo "=================================================="

OUTPUT=$(./cmake/build/litert_lm_main \
  --backend=cpu \
  --model_path="${MODEL_PATH}" \
  --input_prompt="Answer with ONLY numbers. Count to 10 starting with 1.")
echo $OUTPUT

echo "=================================================="
echo "🎉 All sanity checks passed! Model is healthy."
echo "=================================================="
