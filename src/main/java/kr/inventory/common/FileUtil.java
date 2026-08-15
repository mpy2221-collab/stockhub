package kr.inventory.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Locale;
import java.util.UUID;
import javax.servlet.http.Part;

/**
 * 품목 대표 이미지를 업로드 폴더에 저장하고 지운다.
 */
public final class FileUtil {
  // public static final String UPLOAD_DIR = "C:/Temp/stock";
  public static final String UPLOAD_DIR = "/home/ubuntu/stock_hub";
  public static final long MAX_BYTES = 5L * 1024 * 1024;

  private FileUtil() {
  }

  /**
   * 비어 있으면 통과. 값이 있으면 허용 확장자만.
   */
  public static boolean isAllowedPath(String fileName) {
    if (fileName == null || fileName.isEmpty()) {
      return true;
    }
    return isAllowedExt(extension(fileName));
  }

  public static boolean isAllowedExt(String ext) {
    if (ext == null) {
      return false;
    }
    String e = ext.toLowerCase(Locale.ROOT);
    return "jpg".equals(e) || "jpeg".equals(e) || "png".equals(e) || "webp".equals(e);
  }

  /**
   * 파일이 없으면 null. 확장자·용량이 아니면 빈 문자열.
   */
  public static String save(Part part) throws IOException {
    if (part == null || part.getSize() == 0) {
      return null;
    }
    if (part.getSize() > MAX_BYTES) {
      return "";
    }
    String ext = extension(part.getSubmittedFileName());
    if (!isAllowedExt(ext)) {
      return "";
    }
    File dir = new File(UPLOAD_DIR);
    if (!dir.exists()) {
      Files.createDirectories(dir.toPath());
    }
    String name = "tmp_" + UUID.randomUUID().toString().replace("-", "") + "." + ext.toLowerCase(Locale.ROOT);
    part.write(new File(dir, name).getAbsolutePath());
    return name;
  }

  public static void delete(String fileName) {
    File file = resolve(fileName);
    if (file != null && file.isFile()) {
      file.delete();
    }
  }

  public static File resolve(String fileName) {
    if (fileName == null || fileName.isEmpty()) {
      return null;
    }
    if (fileName.contains("..") || fileName.contains("/") || fileName.contains("\\")) {
      return null;
    }
    return new File(UPLOAD_DIR, fileName);
  }

  public static String contentType(String fileName) {
    String ext = extension(fileName);
    if ("png".equalsIgnoreCase(ext)) {
      return "image/png";
    }
    if ("webp".equalsIgnoreCase(ext)) {
      return "image/webp";
    }
    return "image/jpeg";
  }

  public static String extension(String fileName) {
    if (fileName == null) {
      return null;
    }
    int dot = fileName.lastIndexOf('.');
    if (dot < 0 || dot == fileName.length() - 1) {
      return null;
    }
    return fileName.substring(dot + 1);
  }
}
