function get_yt_dlp_filename() {
    local title=$1
    local vid=$2
    local length=${3:-50}
    local zipfile=$(echo "$title-$vid" | sed -e 's/ /_/g' -e 's/\//_/g' -e 's/|/_/g' -e 's/"/_/g' -e "s/'/_/g" -e 's/\?/_/g' -e 's/:/_/g' | cut -c1-$length).zip
    return "$zipfile"
}

function yt-dlp-ng() {
  local localDir="$1"
  shift
  docker run -i --rm -v "${localDir}:/data" falconchen/arm64v8-yt-dlp \
    -v /root/arm64v8-youtube-dl/ytl-dlp.conf:/etc/yt-dlp.conf \
    -f '(bv*[vcodec^=vp9][height>=1024]+ba[acodec=opus])/22/137+ba[ext=m4a]/137+ba/302+ba[ext=m4a]/302+ba/bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo[ext=mp4]+(258/256/140)/bestvideo[ext=webm]+(250/249)/bestvideo[ext=webm]+bestaudio/mp4/best' \
    "$@"
}

function sanitize_filename(){
   local string="$1"
   #echo "$string" | sed 's/[^a-zA-Z0-9._\-\p{L}]/_/g'
   echo "$string" | tr '/|\"'\'' ' '_'
}


function rename_files() {
  # 判断参数是否存在
  if [[ -z "$1" ]]; then
    echo "请提供要重命名的目录名"
    exit 1
  fi

  local dir="$1"

  # 检查目录是否存在
  if [[ ! -d "$dir" ]]; then
    echo "目录 $dir 不存在"
    exit 1
  fi

  # 遍历目录下所有文件，重命名
  for file in "$dir"/*; do
    if [[ -f "$file" ]]; then
      local filename="$(basename "$file")"
      local new_filename="$(sanitize_filename "$filename")"
      if [[ "$filename" != "$new_filename" ]]; then
        local new_path="$dir/$new_filename"
        mv -n "$file" "$new_path"
        echo "重命名 $file 为 $new_path"
      fi
    fi
  done
}

