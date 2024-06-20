package com.example.goodjob.util;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {

	private static final String UPLOAD_DIR = "C:/dev/ws/goodjob/goodjob-web/src/main/webapp/static/imgsrc";

	public static String saveFile(String fileName, MultipartFile multipartFile) throws IOException {
		Path uploadPath = Paths.get(UPLOAD_DIR);

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        String originalFileName = multipartFile.getOriginalFilename();
        Path filePath = uploadPath.resolve(originalFileName);

        try (InputStream inputStream = multipartFile.getInputStream()) {
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
            return originalFileName; // 파일 이름만 반환
        } catch (IOException ioe) {
            throw new IOException("Could not save file: " + originalFileName, ioe);
        }
    }

}
