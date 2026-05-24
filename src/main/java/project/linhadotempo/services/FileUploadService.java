package project.linhadotempo.services;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class FileUploadService {

    private final Cloudinary cloudinary;

    public String upload(MultipartFile file) {
        try {
            Map uploadResult = cloudinary.uploader().upload(
                    file.getBytes(),
                    ObjectUtils.emptyMap()
            );
            return uploadResult.get("secure_url").toString();
        } catch (IOException e) {
            throw new RuntimeException("Erro ao fazer upload da imagem");
        }
    }

    public void deleteByUrl(String imageUrl) {
        if (imageUrl == null || imageUrl.isBlank()) return;
        try {
            String publicId = extractPublicId(imageUrl);
            cloudinary.uploader().destroy(publicId, ObjectUtils.emptyMap());
        } catch (Exception e) {
            log.warn("Falha ao deletar imagem do Cloudinary: {}", imageUrl, e);
        }
    }

    public void deleteAllByUrls(List<String> urls) {
        if (urls == null) return;
        urls.forEach(this::deleteByUrl);
    }

    private String extractPublicId(String imageUrl) {
        // formato: .../image/upload/v{version}/{public_id}.{ext}
        String[] parts = imageUrl.split("/upload/");
        if (parts.length < 2) return imageUrl;

        String afterUpload = parts[1];

        // remove versão opcional (ex: v1312461204/)
        afterUpload = afterUpload.replaceFirst("^v\\d+/", "");

        // remove extensão
        int dotIndex = afterUpload.lastIndexOf('.');
        if (dotIndex != -1) {
            afterUpload = afterUpload.substring(0, dotIndex);
        }

        return afterUpload;
    }
}
