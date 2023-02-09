class ApplicationSerializer < ActiveModel::Serializer
  # Serializer内で、参照した別テーブルの全てのattributeを参照するように設定する
  # 各Serializerでこの設定を変更することも可能
  # ex.. https://github.dev/discourse/discourse/tree/v2.7.9/app/serializers
  # embed :ids, include: true
end