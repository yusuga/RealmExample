//
//  Model.h
//  RealmExample
//
//  Created by Yu Sugawara on 7/25/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import <Realm/Realm.h>

@interface Model : RLMObject

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Model>
RLM_ARRAY_TYPE(Model)
