			##                ##########################
######## ## ## #####    ##### # []
## ## ## ## ## ## ##    ## ## # 2024-
## ## ## ## ## ## ## ## ## ## # milo-o.fun@qq.com
## ## ## ## ## #####    ##### ##########################

## 
@tool class_name MP·绘图 extends Object

static func 矩形(size:Vector2,pos:Vector2 = Vector2(0,0)):
	var r :PackedVector2Array = [
		pos,
		pos + Vector2(size.x,0),
		pos + Vector2(size.x,size.y),
		pos + Vector2(0,size.y)
	]
	return r

static func 全标(
		size:Vector2,pos:Vector2 = Vector2(0,0),
		idx :int = 1,                # 插入角位置
		Iofs :Vector2 = Vector2(0,0),# 插入点偏移
		Vofs :Vector2 = Vector2(0,0) # 周边点偏移
	):
	var r = 矩形(size,pos)
	r[idx-1] += Vofs
	r[idx]   += Vofs
	var v = (r[idx-1]+r[idx])/2
	r.insert(idx, v+Iofs)
	return r

class 金标设置类 :
	var idxs :int      # 插入角位置
	var Iofs :Vector2  # 插入点偏移
	var Vofs :Vector2  # 周边点偏移
	func _init(id:int,io:Vector2,vo:Vector2):
		idxs = id
		Iofs = io
		Vofs = vo

static func 金标(
		size:Vector2,pos:Vector2 = Vector2(0,0),
		sets: Array = []
	):
	var r = 矩形(size,pos)
	for s in sets:
		r[s.idxs-1] += s.Vofs
		r[s.idxs]   += s.Vofs
		var v = (r[s.idxs-1]+r[s.idxs])/2
		r.insert(s.idxs, v+s.Iofs)
	return r
