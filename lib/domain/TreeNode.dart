import 'package:json_annotation/json_annotation.dart';
import 'package:paperless_app/domain/FileInfo.dart';
part 'TreeNode.g.dart';
@JsonSerializable()
class TreeNode extends Object {//with $TreeNodeSerializerMixin
   int id;
   String text;                                     //文件名
   List<TreeNode> children;                        //字节点
   num parentId;  			                             //父节点
   String path;                                    //文件路径
   String uid;                                    //用户id
   String roomid;                              //是否属于哪个会议文件夹
   List<FileInfo> fileInfoList;

   TreeNode(this.id, this.text, this.children, this.parentId, this.path,
       this.uid, this.roomid, this.fileInfoList);

   @override
   String toString() {
     return 'TreeNode{id: $id, text: $text, children: $children, parentId: $parentId, path: $path, uid: $uid, roomid: $roomid, fileInfoList: $fileInfoList}';
   }

   factory TreeNode.fromJson(Map<String, dynamic> json) =>
       _$TreeNodeFromJson(json);

   Map<String, dynamic> toJson() => _$TreeNodeToJson(this);


}