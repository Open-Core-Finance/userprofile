package tech.corefinance.userprofile.repository;

import org.springframework.stereotype.Repository;
import tech.corefinance.common.repository.CommonResourceRepository;
import tech.corefinance.userprofile.entity.LoginSession;

import java.util.Optional;

@Repository
public interface LoginSessionRepository extends CommonResourceRepository<LoginSession, String> {
    Optional<LoginSession> findByIdAndRefreshToken(String loginId, String refreshToken);
}
