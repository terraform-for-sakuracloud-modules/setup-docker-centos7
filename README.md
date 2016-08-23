# setup-docker-centos7

## 概要

さくらのクラウド上のCentOS 7.xサーバーにDockerをインストールするスタートアップスクリプト
  
## Variables

| 変数名        | 名称     | デフォルト値 | 説明       | 
|--------------|----------|---------|---------------|
|name          | 名称      | `install_docker_script`    | - |
  
## Output

| 変数名           | 名称       | 説明       | 
|-----------------|------------|------------|
|note_id          | ID         |  スタートアップスクリプトのID |
|note_content     | コンテンツ   |  スタートアップスクリプトのコンテンツ |

## Example

```main.if:サンプル
# Dockerインストール用スクリプト
module "install_docker_script" {
    source = "github.com/terraform-for-sakuracloud-modules/setup-docker-centos7"
}

# インストール元アーカイブ
data sakuracloud_archive "centos" {
    filter = {
        name   = "Tags"
        values = ["current-stable", "arch-64bit", "distro-centos"]
    }
}

# ディスク(CentOSベース)
resource "sakuracloud_disk" "disk01" {
    name = "disk01"
    source_archive_id = "${data.sakuracloud_archive.centos.id}"

    # モジュールにて定義されているスタートアップスクリプトのIDを指定
    note_ids = ["${module.install_docker_script.note_id}"] 
}

# サーバー
resource sakuracloud_server "server01" {
    name = "server01"
    disks = ["${sakuracloud_disk.disk01.id}"]
}

```

## License

  This project is published under [Apache 2.0 License](LICENSE).

## Author

  * Kazumichi Yamamoto ([@yamamoto-febc](https://github.com/yamamoto-febc))
