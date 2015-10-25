# DDWaterFall
基于UIScrollView下的仿照tableView的数据源和代理方法，实现瀑布流

- (NSUInteger)numberOfCellsInWaterflowView:(DDWaterFolwView *)waterflowView;

- (DDWaterFlowViewCell *)waterflowView:(DDWaterFolwView *)waterflowView cellAtIndex:(NSUInteger)index;

- (NSUInteger)numberOfColumnsInWaterflowView:(DDWaterFolwView *)waterflowView;

- (CGFloat)waterflowView:(DDWaterFolwView *)waterflowView heightForCellAtIndex:(NSInteger)index;

- (void)waterflowView:(DDWaterFolwView *)waterflowView didSelectCellAtIndex:(NSInteger)index;

- (CGFloat)widthForCell;

- (CGFloat)waterflowView:(DDWaterFolwView *)waterflowView marginForType:(DDWaterFolwViewMarginType)type;

@property (nonatomic,weak)id <DDWaterFolwViewDataSource> dataSource;

@property (nonatomic,weak)id <DDWaterFolwViewDelegate> delegate;

/**
 *  刷新数据源的方法
 */
- (void)reloadData;
/**
 *  根据标识向缓存池中取出可以复用的cell
 */
- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier;

