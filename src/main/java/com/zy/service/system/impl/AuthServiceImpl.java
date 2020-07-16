package com.zy.service.system.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.entity.easyui.TreeNode;
import com.zy.entity.system.Auth;
import com.zy.mapper.system.AuthMapper;
import com.zy.mapper.system.Role_AuthMapper;
import com.zy.service.system.AuthService;

/**
 * 
 * @author Administrator
 *
 */
@Service
@Transactional
public class AuthServiceImpl implements AuthService {

	@Resource
	private AuthMapper mapper;

	@Resource
	private Role_AuthMapper ramapper;

	/**
	 * 
	 * @MethodName: query
	 * @return
	 * @see com.zy.service.system.AuthService#query()
	 * @Description: TODO
	 * @date 2020-07-16 07:41:40
	 */
	@Override
	public List<Auth> query() {
		// TODO Auto-generated method stub
		// 查询第一层
		List<Auth> list = mapper.queryRoot();
		// 遍历第一层
		for (Auth auth : list) {
			// 如果有子树
			if (auth.getChildren().size() > 0) {
				// 遍历子树
				for (Auth au : auth.getChildren()) {
					// 要给子树设置子树，需要重新调用getChildren方法查询数据库
					au.setChildren(getChildren(au));
				}
			}
		}
		return list;
	}

	/**
	 * 
	 * @MethodName: getChildren
	 * @param auth
	 * @return List<Auth>
	 * @Description: TODO
	 * @date 2020-07-16 07:41:43
	 */
	private List<Auth> getChildren(Auth auth) {
		// TODO Auto-generated method stub
		List<Auth> list = new ArrayList<>();
		Auth au = mapper.query(auth.getId());
		// 是否有子树
		if (au.getChildren().size() > 0) {
			// 遍历子树
			for (Auth a : au.getChildren()) {
				// 将子树添加到list中
				list.add(a);
				// 递归查找子树的子树
				a.setChildren(getChildren(a));
			}
		}
		return list;
	}

	/**
	 * 
	 * @MethodName: combotree
	 * @return
	 * @see com.zy.service.system.AuthService#combotree()
	 * @Description: TODO
	 * @date 2020-07-16 07:41:46
	 */
	@Override
	public List<TreeNode> combotree() {
		// TODO Auto-generated method stub
		List<TreeNode> tree = new ArrayList<TreeNode>();
		// 调用上面的query方法，查询出所有的权限
		List<Auth> list = this.query();
		// 遍历权限
		for (Auth auth : list) {
			// 将auth转换为treenode
			TreeNode node = this.changeTreeNode(auth);
			tree.add(node);
		}
		return tree;
	}

	/**
	 * 
	 * @MethodName: changeTreeNode
	 * @param auth
	 * @return TreeNode
	 * @Description: TODO
	 * @date 2020-07-16 07:41:49
	 */
	private TreeNode changeTreeNode(Auth auth) {
		TreeNode node = new TreeNode();
		node.setId(String.valueOf(auth.getId()));
		node.setText(auth.getName());
		// 如果auth有子树
		if (auth.getChildren().size() > 0) {
			node.setChildren(this.getAuthChildren(auth.getChildren()));
		}

		return node;
	}

	/**
	 * 
	 * @MethodName: getAuthChildren
	 * @param list
	 * @return List<TreeNode>
	 * @Description: TODO
	 * @date 2020-07-16 07:41:52
	 */
	private List<TreeNode> getAuthChildren(List<Auth> list) {
		List<TreeNode> tree = new ArrayList<>();
		// 遍历权限
		for (Auth auth : list) {
			TreeNode node = this.changeTreeNode(auth);
			tree.add(node);
			// 如果auth有子树
			if (auth.getChildren().size() > 0) {
				node.setChildren(this.getAuthChildren(auth.getChildren()));
			}
		}
		return tree;
	}

	/**
	 * 
	 * @MethodName: selectByPrimaryKey
	 * @param id
	 * @return
	 * @see com.zy.service.system.AuthService#selectByPrimaryKey(java.lang.Integer)
	 * @Description: TODO
	 * @date 2020-07-16 07:41:56
	 */
	@Override
	public Auth selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(id);
	}

	/**
	 * 
	 * @MethodName: add
	 * @param auth
	 * @return
	 * @see com.zy.service.system.AuthService#add(com.zy.entity.system.Auth)
	 * @Description: TODO
	 * @date 2020-07-16 07:42:01
	 */
	@Override
	public int add(Auth auth) {
		return mapper.insertSelective(auth);
	}

	/**
	 * 
	 * @MethodName: editAuth
	 * @param auth
	 * @return
	 * @see com.zy.service.system.AuthService#editAuth(com.zy.entity.system.Auth)
	 * @Description: TODO
	 * @date 2020-07-16 07:42:04
	 */
	@Override
	public int editAuth(Auth auth) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(auth);
	}

	/**
	 * 
	 * @MethodName: remove
	 * @param id
	 * @return
	 * @see com.zy.service.system.AuthService#remove(java.lang.Integer)
	 * @Description: TODO
	 * @date 2020-07-16 07:42:07
	 */
	@Override
	public int remove(Integer id) {
		// TODO Auto-generated method stub
		ramapper.deleteByAuthId(id);
		return mapper.deleteByPrimaryKey(id);
	}
}
