 class FileType {

  // 缓存文件类型信息
    Map<String,num> mFileTypes=new Map();

   FileType(){
     mFileTypes.putIfAbsent("jpg",()=>1);
     mFileTypes.putIfAbsent("png",()=>2);
     mFileTypes.putIfAbsent("gif",()=>3);
     mFileTypes.putIfAbsent("tif",()=>4);
     mFileTypes.putIfAbsent("bmp",()=>5);
     //
     mFileTypes.putIfAbsent("dwg",()=>6); // CAD
     mFileTypes.putIfAbsent("psd",()=>7);
     mFileTypes.putIfAbsent("rtf",()=>8); // 日记本
     mFileTypes.putIfAbsent("xml",()=>9);
     mFileTypes.putIfAbsent("html",()=>10);
     mFileTypes.putIfAbsent("eml",()=>11); // 邮件
     mFileTypes.putIfAbsent("doc",()=>12);
     mFileTypes.putIfAbsent("mdb",()=>13);
     mFileTypes.putIfAbsent("ps",()=>14);
     mFileTypes.putIfAbsent("pdf",()=>15);
     mFileTypes.putIfAbsent("docx",()=>16);
     mFileTypes.putIfAbsent("rar",()=>17);
     mFileTypes.putIfAbsent("wav",()=>18);
     mFileTypes.putIfAbsent("avi",()=>19);
     mFileTypes.putIfAbsent("rm",()=>20);
     mFileTypes.putIfAbsent("mpg",()=>21);
     mFileTypes.putIfAbsent("mpg",()=>22);
     mFileTypes.putIfAbsent("mov",()=>23);
     mFileTypes.putIfAbsent("asf",()=>24);
     mFileTypes.putIfAbsent("mid",()=>25);
     mFileTypes.putIfAbsent("gz",()=>26);
     mFileTypes.putIfAbsent("exe/dll",()=>27);
     mFileTypes.putIfAbsent("txt",()=>28);

   }

   static  getFileType(){
     return  FileType();
   }
  // images

}
