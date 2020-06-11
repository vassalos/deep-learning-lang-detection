#-*- coding: utf-8 -*-
FTI_STUFF = [
'Description', # ()
'Title', # ()
'allowDiscussion', # ()
'allow_discussion',
'allowed_content_types',
'content_icon',
'content_meta_type',
'default_view',
'default_view_fallback',
'description',
'factory',
'filter_content_types',
'getId', # ()
'global_allow',
'immediate_view',
'isPrincipiaFolderish',
'listActions', # ()
]


ALL_FTI_STUFF = [
#'COPY',
#'COPY__roles__',
#'DELETE',
#'DELETE__roles__',
'Description',
#'Description__roles__',
#'HEAD',
#'HEAD__roles__',
#'LOCK',
#'LOCK__roles__',
#'MKCOL',
#'MOVE',
#'MOVE__roles__',
#'Metatype',
#'Metatype__roles__',
#'OPTIONS',
#'OPTIONS__roles__',
#'PROPFIND',
#'PROPFIND__roles__',
#'PROPPATCH',
#'PROPPATCH__roles__',
#'PUT',
#'REQUEST',
#'TRACE',
#'TRACE__roles__',
'Title',
#'Title__roles__',
#'UNLOCK',
#'UNLOCK__roles__',
#'__ac_local_roles__',
#'__ac_permissions__',
#'__ac_roles__',
#'__allow_access_to_unprotected_subobjects__',
#'__class__',
#'__class_init__',
#'__dav_resource__',
#'__delattr__',
#'__dict__',
#'__doc__',
#'__getattribute__',
#'__getnewargs__',
#'__getstate__',
#'__hash__',
#'__http_methods__',
#'__implemented__',
#'__implements__',
#'__init__',
#'__len__',
#'__module__',
#'__name__',
#'__new__',
#'__of__',
#'__propsets__',
#'__providedBy__',
#'__provides__',
#'__reduce__',
#'__reduce_ex__',
#'__repr__',
#'__roles__',
#'__setattr__',
#'__setstate__',
#'__str__',
#'__weakref__',
#'_actions',
#'_actions_form',
#'_addRole',
#'_advanced_properties',
#'_aliases',
#'_basic_properties',
#'_canCopy',
#'_cloneActions',
#'_cloneActions__roles__',
#'_constructInstance',
#'_constructInstance__roles__',
#'_delPropValue',
#'_delProperty',
#'_delRoles',
#'_deleteOwnershipAfterAdd',
#'_extractAction',
#'_extractAction__roles__',
#'_finishConstruction',
#'_finishConstruction__roles__',
#'_getCopy',
#'_getExprContext',
#'_getFactoryMethod',
#'_getOAI',
#'_has_user_defined_role',
#'_isBeingAccessedAsZClassDefinedInstanceMethod',
#'_isBeingUsedAsAMethod',
#'_manage_editedDialog',
#'_method_manage_access',
#'_normal_manage_access',
#'_notifyOfCopyTo',
#'_old_filtered_manage_options',
#'_p_activate',
#'_p_changed',
#'_p_deactivate',
#'_p_delattr',
#'_p_getattr',
#'_p_invalidate',
#'_p_jar',
#'_p_mtime',
#'_p_oid',
#'_p_serial',
#'_p_setattr',
#'_p_state',
#'_postCopy',
#'_properties',
#'_propertyMap',
#'_queryFactoryMethod',
#'_reserved_names',
#'_setId',
#'_setPropValue',
#'_setProperty',
#'_setRoles',
#'_updateProperty',
#'_wrapperCheck',
#'absolute_url',
#'absolute_url__roles__',
#'absolute_url_path',
#'absolute_url_path__roles__',
#'ac_inherited_permissions',
#'ac_inherited_permissions__roles__',
#'access_debug_info',
#'access_debug_info__roles__',
#'aclAChecked',
#'aclEChecked',
#'aclPChecked',
#'acquiredRolesAreUsedBy',
#'acquiredRolesAreUsedBy__roles__',
#'addAction',
#'addAction__roles__',
'allowDiscussion',
#'allowDiscussion__roles__',
#'allowType',
#'allowType__roles__',
'allow_discussion',
'allowed_content_types',
#'analyseDocumentation',
#'analyseDocumentation__roles__',
#'bobobase_modification_time',
#'cb_isCopyable',
#'cb_isMoveable',
#'cb_userHasCopyOrMovePermission',
#'changeActions',
#'changeActions__roles__',
#'changeOwnership',
#'changeOwnership__roles__',
#'class_manage_path',
#'class_manage_path__roles__',
#'constructInstance',
#'constructInstance__roles__',
'content_icon',
'content_meta_type',
#'dav__init',
#'dav__simpleifhandler',
#'dav__validate',
#'defaultView',
#'defaultView__roles__',
'default_view',
'default_view_fallback',
#'deleteActions',
#'deleteActions__roles__',
'description',
'factory',
'filter_content_types',
#'filtered_manage_options',
#'filtered_manage_options__roles__',
#'getActionInfo',
#'getActionInfo__roles__',
#'getActionObject',
#'getActionObject__roles__',
#'getAttribute',
#'getAttributeNode',
#'getAttributeNode__roles__',
#'getAttribute__roles__',
#'getAttributes',
#'getAttributes__roles__',
#'getAvailableViewMethods',
#'getAvailableViewMethods__roles__',
#'getChildNodes',
#'getChildNodes__roles__',
#'getDefaultPage',
#'getDefaultPage__roles__',
#'getDefaultViewMethod',
#'getDefaultViewMethod__roles__',
#'getElementsByTagName',
#'getElementsByTagName__roles__',
#'getFirstChild',
#'getFirstChild__roles__',
#'getIcon',
#'getIcon__roles__',
'getId',
#'getId__roles__',
#'getLastChild',
#'getLastChild__roles__',
#'getMethodAliases',
#'getMethodAliases__roles__',
#'getNextSibling',
#'getNextSibling__roles__',
#'getNodeName',
#'getNodeName__roles__',
#'getNodeType',
#'getNodeValue',
#'getNodeValue__roles__',
#'getOwner',
#'getOwnerDocument',
#'getOwnerDocument__roles__',
#'getOwnerTuple',
#'getOwnerTuple__roles__',
#'getOwner__roles__',
#'getParentNode',
#'getParentNode__roles__',
#'getPhysicalPath',
#'getPhysicalPath__roles__',
#'getPhysicalRoot',
#'getPhysicalRoot__roles__',
#'getPreviousSibling',
#'getPreviousSibling__roles__',
#'getProperty',
#'getPropertyType',
#'getPropertyType__roles__',
#'getProperty__roles__',
#'getTagName',
#'getTagName__roles__',
#'getViewMethod',
#'getViewMethod__roles__',
#'getWrappedOwner',
#'getWrappedOwner__roles__',
#'get_local_roles',
#'get_local_roles_for_userid',
#'get_request_var_or_attr',
#'get_valid_userids',
#'globalAllow',
#'globalAllow__roles__',
'global_allow',
#'hasChildNodes',
#'hasChildNodes__roles__',
#'hasProperty',
#'hasProperty__roles__',
#'has_local_roles',
#'http__etag',
#'http__parseMatchList',
#'http__processMatchHeaders',
#'http__refreshEtag',
#'i18n_domain',
#'icon',
#'id',
'immediate_view',
#'isConstructionAllowed',
#'isConstructionAllowed__roles__',
'isPrincipiaFolderish',
#'isTopLevelPrincipiaApplicationObject',
#'listActionInfos',
#'listActionInfos__roles__',
'listActions',
#'listActions__roles__',
#'listDAVObjects',
#'listDAVObjects__roles__',
#'locked_in_version',
#'manage',
#'manage_DAVget',
#'manage_DAVget__roles__',
#'manage_FTPlist',
#'manage_FTPlist__roles__',
#'manage_FTPstat',
#'manage_FTPstat__roles__',
#'manage_UndoForm',
#'manage_UndoForm__roles__',
#'manage__roles__',
#'manage_access',
#'manage_access__roles__',
#'manage_acquiredForm',
#'manage_acquiredForm__roles__',
#'manage_acquiredPermissions',
#'manage_acquiredPermissions__roles__',
#'manage_addLocalRoles',
#'manage_addLocalRoles__roles__',
#'manage_addProperty',
#'manage_addProperty__roles__',
#'manage_afterAdd',
#'manage_afterAdd__roles__',
#'manage_afterClone',
#'manage_afterClone__roles__',
#'manage_aliases',
#'manage_aliases__roles__',
#'manage_beforeDelete',
#'manage_beforeDelete__roles__',
#'manage_changeOwnershipType',
#'manage_changeOwnershipType__roles__',
#'manage_changePermissions',
#'manage_changePermissions__roles__',
#'manage_changeProperties',
#'manage_changeProperties__roles__',
#'manage_changePropertyTypes',
#'manage_changePropertyTypes__roles__',
#'manage_defined_roles',
#'manage_defined_roles__roles__',
#'manage_delLocalRoles',
#'manage_delLocalRoles__roles__',
#'manage_delProperties',
#'manage_delProperties__roles__',
#'manage_editActionsForm',
#'manage_editActionsForm__roles__',
#'manage_editLocalRoles',
#'manage_editLocalRoles__roles__',
#'manage_editProperties',
#'manage_editProperties__roles__',
#'manage_editRoles',
#'manage_editRoles__roles__',
#'manage_editedDialog',
#'manage_editedDialog__roles__',
#'manage_fixupOwnershipAfterAdd',
#'manage_fixupOwnershipAfterAdd__roles__',
#'manage_getPermissionMapping',
#'manage_getPermissionMapping__roles__',
#'manage_listLocalRoles',
#'manage_listLocalRoles__roles__',
#'manage_options',
#'manage_owner',
#'manage_owner__roles__',
#'manage_permission',
#'manage_permissionForm',
#'manage_permissionForm__roles__',
#'manage_permission__roles__',
#'manage_propertiesForm',
#'manage_propertiesForm__roles__',
#'manage_propertyTypeForm',
#'manage_propertyTypeForm__roles__',
#'manage_role',
#'manage_roleForm',
#'manage_roleForm__roles__',
#'manage_role__roles__',
#'manage_setLocalRoles',
#'manage_setLocalRoles__roles__',
#'manage_setMethodAliases',
#'manage_setMethodAliases__roles__',
#'manage_setPermissionMapping',
#'manage_setPermissionMapping__roles__',
#'manage_tabs',
#'manage_tabs__roles__',
#'manage_takeOwnership',
#'manage_takeOwnership__roles__',
#'manage_undo_transactions',
#'manage_undo_transactions__roles__',
#'manage_workspace',
#'manage_workspace__roles__',
#'meta_type',
#'modified_in_version',
#'moveDownActions',
#'moveDownActions__roles__',
#'moveUpActions',
#'moveUpActions__roles__',
#'objectIds',
#'objectItems',
#'objectValues',
#'owner_info',
#'owner_info__roles__',
#'permissionMappingPossibleValues',
#'permission_settings',
#'permission_settings__roles__',
#'permissionsOfRole',
#'permissionsOfRole__roles__',
#'possible_permissions',
#'product',
#'propdict',
#'propdict__roles__',
#'propertyDescription',
#'propertyDescription__roles__',
#'propertyIds',
#'propertyIds__roles__',
#'propertyItems',
#'propertyItems__roles__',
#'propertyLabel',
#'propertyLabel__roles__',
#'propertyMap',
#'propertyMap__roles__',
#'propertyValues',
#'propertyValues__roles__',
#'propertysheets',
#'queryMethodID',
#'queryMethodID__roles__',
#'raise_standardErrorMessage',
#'restrictedTraverse',
#'restrictedTraverse__roles__',
#'rolesOfPermission',
#'rolesOfPermission__roles__',
#'selectedRoles',
#'setMethodAliases',
#'setMethodAliases__roles__',
#'showDocumentation',
#'showDocumentation__roles__',
#'smallRolesWidget',
#'tabs_path_default',
#'tabs_path_info',
#'this',
#'title',
#'title_and_id',
#'title_or_id',
#'tpURL',
#'tpValues',
#'undoable_transactions',
#'undoable_transactions__roles__',
#'unrestrictedTraverse',
#'unrestrictedTraverse__roles__',
#'userCanTakeOwnership',
#'userdefined_roles',
#'userdefined_roles__roles__',
#'users_with_local_role',
#'validRoles',
#'valid_property_id',
#'valid_property_id__roles__',
#'valid_roles',
#'validate_roles',
#'view_methods',
#'virtual_url_path',
#'virtual_url_path__roles__',
#'wl_clearLocks',
#'wl_clearLocks__roles__',
#'wl_delLock',
#'wl_delLock__roles__',
#'wl_getLock',
#'wl_getLock__roles__',
#'wl_hasLock',
#'wl_isLocked',
#'wl_isLockedByUser__roles__',
#'wl_isLocked__roles__',
#'wl_lockItems',
#'wl_lockItems__roles__',
#'wl_lockTokens',
#'wl_lockTokens__roles__',
#'wl_lockValues',
#'wl_lockValues__roles__',
#'wl_lockmapping',
#'wl_lockmapping__roles__',
#'wl_setLock',
#'wl_setLock__roles__',
]