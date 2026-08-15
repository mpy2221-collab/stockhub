package kr.inventory.member.dao;

import java.util.List;
import kr.inventory.member.dto.Member;
import kr.inventory.member.dto.MemberSearch;
import org.apache.ibatis.annotations.Param;

/**
 * 회원 매퍼.
 */
public interface MemberDao {
  Member selectById(String memberId);

  int countById(String memberId);

  int countByEmail(String memberEmail);

  int insert(Member member);

  int update(Member member);

  int updatePw(@Param("memberId") String memberId, @Param("memberPw") String memberPw);

  List<Member> selectAll();

  List<Member> selectList(MemberSearch search);

  int countAll();

  int countByLevel(int memberLevel);

  int updateLevel(@Param("memberId") String memberId, @Param("memberLevel") int memberLevel);

  int delete(String memberId);
}
